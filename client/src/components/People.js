import React, { Component } from 'react';
import Reflux from 'reflux';
import styled from 'styled-components';
import PersonStore from '../stores/PersonStore'
import PeopleActions from '../actions/PeopleActions'
import Person from './Person';
import pageControls from './PageControls';

const Wrapper = styled.div`
  display: flex;
  justify-content: space-around;
`;
const Container = styled.div`
  background: white;
  padding: 0 40px;
  width: 80%;
`
const PageControls = styled(pageControls)`
  margin: 10px 0;
`
export default class People extends Reflux.Component {
  constructor() {
    super();
    this.store = PersonStore;
    this.handlePageChange = this.handlePageChange.bind(this)
  }

  componentDidMount() {
    PeopleActions.getPeople();
  }

  handlePageChange(pageNum) {
    PeopleActions.getPeople({ page: pageNum });
  }

  render() {
    const { people, metadata } = this.state;
    return (
      <Wrapper>
        <Container>
          <PageControls {...metadata.paging} onPageChange={this.handlePageChange} />
          {people.map(person => (<Person {...person} key={person.id}/>))}
        </Container>
      </Wrapper>
    )
  }
}
