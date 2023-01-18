import { moduleFor, test } from 'ember-qunit';

moduleFor('validator:check-above-zero', 'Unit | Validator | check-above-zero', {
  needs: ['validator:messages']
});

test('it works', function(assert) {
  var validator = this.subject();
  assert.ok(validator);
});
