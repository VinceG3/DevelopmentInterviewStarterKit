import React, { Component } from 'react';
import styled from 'styled-components';

const Wrapper = styled.div``
const A = styled.a`text-decoration: none;`
const PrevControl = styled(A)`
  margin-right: 15px;
  visibility: ${props => props.visible ? 'visible' : 'hidden'};
`
const NextControl = styled(A)`margin-left: 15px;`
/* current api is not giving me the total number of pages. I could work around the issue
   by preloading the next page, if it gives a 404, hide the next page control */

export default class PageControls extends Component {
  constructor() {
    super();
    this.handlePrev = this.handlePrev.bind(this);
    this.handleNext = this.handleNext.bind(this);
  }

  handlePrev() { this.props.onPageChange(this.props.current_page - 1) };
  handleNext() { this.props.onPageChange(this.props.current_page + 1) };

  render() {
    const { total_pages, current_page, className } = this.props
    return (
      <Wrapper className={className}>
        <PrevControl visible={current_page !== 1} href='#' onClick={this.handlePrev}>&lt;</PrevControl>
        <span>Page {current_page}</span>
        <span>{total_pages ? ` of ${total_pages}` : ''}</span>
        <NextControl href='#' onClick={this.handleNext}>&gt;</NextControl>
      </Wrapper>
    )
  }
}
