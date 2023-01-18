import Mixin from '@ember/object/mixin';
import Builder from 'ember-flexberry-data/query/builder';
import { SimplePredicate } from 'ember-flexberry-data/query/predicate';
import FilterOperator from 'ember-flexberry-data/query/filter-operator';

export default Mixin.create({
    afterModel() {
        this._super(...arguments);
        return new Promise(async (resolve, reject) => {
          try {
            const builder = new Builder(this.get('store'), 'i-i-s-shop-invoice').select('id, order.id');
            const invoices = await this.get('store').query('i-i-s-shop-invoice', builder.build());
            const orderIdsIninvoices = invoices.map((i => i.get('order.id')));
            let resultPredicate = null;
            if (orderIdsIninvoices.length > 0) {
              resultPredicate = new SimplePredicate('id', FilterOperator.Neq, orderIdsIninvoices[0]);
            }
        
            if (orderIdsIninvoices.length > 1) {
              orderIdsIninvoices.forEach((oId => {
                resultPredicate = resultPredicate.and(new SimplePredicate('id', FilterOperator.Neq, oId));
              }));
            }
    
            this.set('resultPredicate', resultPredicate);
            resolve(true);
          }
          catch(error) {
            reject(error);
          }
        });
      },
    
      setupController(controller, model) {
        controller.setOrderPredicate(this.get('resultPredicate'));
        this._super(...arguments);
      }
});
