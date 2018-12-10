import React, { Component } from 'react';
import styled from 'styled-components';

const Wrapper = styled.div``

export default class PageControls extends Component {
  render() {
    const { total_pages, current_page } = this.props
    return (
      <Wrapper>
        <span>Page {current_page}</span>
        <span>{total_pages ? ` of ${total_pages}` : ''}</span>
      </Wrapper>
    )
  }
}
