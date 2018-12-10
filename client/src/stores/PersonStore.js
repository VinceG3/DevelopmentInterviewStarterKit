import Reflux from 'reflux'
import PeopleActions from '../actions/PeopleActions'

export default class PersonStore extends Reflux.Store {
  constructor() {
    super();
    this.state = {
      people: [],
      metadata: {},
    }
    this.listenTo(PeopleActions.getPeople.complete, this.onPeopleRetrieved)
    this.listenTo(PeopleActions.getPeople.error, this.onPeopleError)
  }

  onPeopleRetrieved(response) {
    this.setState({
      people: response.data,
      metadata: response.metadata,
    })
  }

  onPeopleError(error) {
    console.log(error)
  }
}
