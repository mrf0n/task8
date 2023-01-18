import EditFormController from 'ember-flexberry/controllers/edit-form';
import { set } from '@ember/object';
import {SimplePredicate} from 'ember-flexberry-data/query/predicate';
import { generateNotOrPredicateByList } from '../utils/generate-predicate-by-list';
import { inject } from '@ember/service';

export default EditFormController.extend({
  parentRoute: 'i-i-s-shop-order-l',
  lookupEventsService: inject('lookup-events'),
  groupEditEventsService: inject('objectlistview-events'),

  init() {
    this._super(...arguments);

    // Ограничение на лукап менеджера
     this.set('managerLimitPredicate', new SimplePredicate('position', 'eq', 'Manager'));
     this.set('productProperties', {
      choose: 'showLookupDialog',
      remove: 'removeLookupValue',
      displayAttributeName: 'name',
      required: false,
      relationName: 'product',
      projection: 'ProductL',
      autocomplete: true,
      lookupLimitPredicate: undefined
    });
    this.get('lookupEventsService').on('lookupDialogOnHidden', this, this._setLookupPredicate);
    this.get('groupEditEventsService').on('olvRowDeleted', this, this._setLookupPredicate);
  },
  willDestroy() {
    this._super(...arguments);
    this.get('lookupEventsService').off('lookupDialogOnHidden', this, this._setLookupPredicate);
    this.get('groupEditEventsService').off('olvRowDeleted', this, this._setLookupPredicate);
  },
  _setLookupPredicate(componentName, record) {
    switch (componentName) {
      case '(orderItemGroupEdit_flexberry-lookup_product)':
      case 'orderItemGroupEdit':
        this.setProductLookupPredicate(record);
        break;
    }
  },
  setProductLookupPredicate(record) {
    let recordId;
    if (record) {
        recordId = record.get('product.id');
    }
    let productIds = [];
    let orderItems = this.get('model.orderItem');
    if (orderItems) {
    orderItems.forEach(item => {
        let product = item.get('product');
        if (product && product.get('id') !== recordId) {
        productIds.push(product.get('id'));
        }
    });
    }

    let predicate = generateNotOrPredicateByList('id', 'eq', productIds);
    this.set('productProperties.lookupLimitPredicate', predicate);
},
  getCellComponent(attr, bindingPath, model) {
    let cellComponent = this._super(...arguments);

    if (attr.kind === 'belongsTo') {
    switch (`${model.modelName}+${bindingPath}`) {
        case 'i-i-s-shop-order-item+product':
        cellComponent.componentProperties = this.get('productProperties');
        break;
    }
    }
    if (bindingPath === 'totalSum') {
      cellComponent.componentName = 'order-item/total-sum';
    }
    return cellComponent;
  },
  
  actions: {
    configurateOrderItemRow(rowConfig) {
    let readonlyColumns = ['priceWTaxes', 'totalSum'];
    set(rowConfig, 'readonlyColumns', readonlyColumns);
    },

    removeLookupValue(lookupProperties) {
        this._super(...arguments);
        if (lookupProperties.relationName === 'product') {
          this.setProductLookupPredicate();
        }
    }
  }
});
