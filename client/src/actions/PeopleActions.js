import Reflux from 'reflux';
import Service from '../service'

const PeopleActions = {};

PeopleActions.getPeople = Reflux.createAction({
  children: ['complete', 'error']
})

PeopleActions.getPeople.listen(function(params = {}) {
  const endpoint = 'api/people';
  return Service.getRequest.call(this, endpoint, params);
})

export default PeopleActions;