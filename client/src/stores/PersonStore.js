import Reflux from 'reflux'
import PeopleActions from '../actions/PeopleActions'

export default class PersonStore extends Reflux.Store {
  constructor() {
    super();
    this.state = {
      people: [],
    }
    PeopleActions.getPeople.complete.listen(this.onPeopleRetrieved)
    PeopleActions.getPeople.error.listen(this.onPeopleError)
  }

  onPeopleRetrieved() {
    console.log('hi')
  }

  onPeopleError() {
    console.log('yikes!')
  }
}
