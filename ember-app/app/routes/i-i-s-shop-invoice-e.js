import EditFormRoute from 'ember-flexberry/routes/edit-form';
import OrderLimitMixin from '../mixins/order-limit-mixin';


export default EditFormRoute.extend(OrderLimitMixin, {
  modelProjection: 'InvoiceE',
  modelName: 'i-i-s-shop-invoice',
  
});
