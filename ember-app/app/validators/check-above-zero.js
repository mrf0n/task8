import BaseValidator from 'ember-cp-validations/validators/base';

const CheckAboveZero = BaseValidator.extend({
  validate(value, /*options, model, attribute*/) {
    if(Number(value)>0){
      return true;
    } else if (value=="" || value==null) {
      let message = `Значение поля не может быть пустым`
        return message;
    }
    else{
        let message = `Значение поля должно быть больше нуля!`
        return message;
    }
  }
});

CheckAboveZero.reopenClass({
  /**
   * Define attribute specific dependent keys for your validator
   *
   * [
   * 	`model.array.@each.${attribute}` --> Dependent is created on the model's context
   * 	`${attribute}.isValid` --> Dependent is created on the `model.validations.attrs` context
   * ]
   *
   * @param {String}  attribute   The attribute being evaluated
   * @param {Unknown} options     Options passed into your validator
   * @return {Array}
   */
  getDependentsFor(/* attribute, options */) {
    return [];
  }
});

export default CheckAboveZero;
