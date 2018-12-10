import React, { Component } from 'react';
import Reflux from 'reflux';
import styled from 'styled-components';
import PersonStore from '../stores/PersonStore'
import PeopleActions from '../actions/PeopleActions'
import Person from './Person';
import PageControls from './PageControls';

const Wrapper = styled.div`
  display: flex;
  justify-content: space-around;
`;
const Container = styled.div`
  background: white;
  padding: 0 40px;
`

export default class People extends Reflux.Component {
  constructor() {
    super();
    this.store = PersonStore;
  }

  componentDidMount() {
    PeopleActions.getPeople()
  }

  render() {
    const { people, metadata } = this.state;
    return (
      <Wrapper>
        <Container>
          <PageControls {...metadata.paging} />
          {people.map(person => (<Person {...person} key={person.id}/>))}
        </Container>
      </Wrapper>
    )
  }
}
