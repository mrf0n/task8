import EditFormNewRoute from 'ember-flexberry/routes/edit-form-new';
import OrderLimitMixin from '../../mixins/order-limit-mixin';

export default EditFormNewRoute.extend(OrderLimitMixin,{
  modelProjection: 'InvoiceE',
  modelName: 'i-i-s-shop-invoice',
  templateName: 'i-i-s-shop-invoice-e',
});
