import $ from 'jquery';
import { buildValidations } from 'ember-cp-validations';
import { computed } from '@ember/object';

import {
  defineBaseModel,
  defineProjections,
  ValidationRules,
  Model as InvoiceMixin
} from '../mixins/regenerated/models/i-i-s-shop-invoice';

import DocumentModel from './i-i-s-shop-document';
import { ValidationRules as ParentValidationRules } from '../mixins/regenerated/models/i-i-s-shop-document';

const Validations = buildValidations($.extend({}, ParentValidationRules, ValidationRules), {
  dependentKeys: ['model.i18n.locale'],
});

let Model = DocumentModel.extend(InvoiceMixin, Validations, {
  nameWInitials: computed('lastName', 'firstName', 'middleName', function() {
    let lastName = this.get('lastName');

    let firstName = this.get('firstName');
    let firastNameInitial = firstName.substr(0, 1).toUpperCase();

    let middleName = this.get('middleName');
    let middleNameInitial = middleName.substr(0, 1).toUpperCase();

    return `${lastName} ${firastNameInitial}.${middleNameInitial}.`;
  }),

  fullName: computed(function() {
    let lastName = this.get('lastName');
    let firstName = this.get('firstName');
    let middleName = this.get('middleName');

    return `${lastName} ${firstName} ${middleName}`;
  }),
  actualTotalSum: computed('invoiceItem.@each.{amount,price}', function() {
    return this.get('invoiceItem').reduce((sum, item) => {
      const price = Number(item.get('price') || 0);
      const amount = Number(item.get('amount') || 0);
      if (Number.isNaN(price) || Number.isNaN(amount)) {
        throw new Error(`Invalid 'priceWTaxes' or 'amount' for order item: '${item}'.`);
      }

      return sum + price * amount;
    }, 0);
  }),
  actualTotalWeight: computed('invoiceItem.@each.{weight}', function() {
    return this.get('invoiceItem').reduce((sum, item) => {
      const weight = Number(item.get('weight') || 0);
      if (Number.isNaN(weight)) {
        throw new Error(`Invalid 'weight' or 'amount' for order item: '${item}'.`);
      }

      return sum + weight;
    }, 0);
  }),

});

defineBaseModel(Model);
defineProjections(Model);

export default Model;
