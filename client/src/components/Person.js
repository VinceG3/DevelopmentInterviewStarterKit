import React, { Component } from 'react';
import styled from 'styled-components';

const Wrapper = styled.div`
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  width: 100%;
  margin: 8px 0;
  padding: 22px 0;
  border-bottom: 1px solid black;
`
const Name = styled.div`
  display: inline-block;
`
const Email = styled.div`
  display: inline-block;
`
const JobTitle = styled.div`
  display: inline-block;
`
export default class Person extends Component {
  render() {
    const { first_name, last_name, email_address, title } = this.props
    return (
      <Wrapper>
        <Name>{`${first_name} ${last_name}`}</Name>
        <Email>{email_address}</Email>
        <JobTitle>{title}</JobTitle>
      </Wrapper>
    )
  }
}