import React, { Component } from 'react';
import Reflux from 'reflux';
import styled from 'styled-components';
import PersonStore from '../stores/PersonStore'
import PeopleActions from '../actions/PeopleActions'

const Wrapper = styled.div``;

const Person = (props) => {
  'hi'
}

export default class People extends Reflux.Component {
  constructor() {
    super();
    this.store = PersonStore;
  }

  componentDidMount() {
    PeopleActions.getPeople()
  }

  render() {
    const { people } = this.state;
    return (
      <Wrapper>
        {people.map(person => (<Person {...person}/>))}
      </Wrapper>
    )
  }
}
