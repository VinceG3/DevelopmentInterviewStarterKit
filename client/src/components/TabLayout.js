import React from 'react';
import styled from 'styled-components';

const Wrapper = styled.div`
  background: grey;
`;
const TabMenu = styled.ul`
  list-style-type: none;
`;
const TabLink = styled.li`
  padding: 10px 20px;
  background: #999;
  display: inline-block;
`;
const Contents = styled.div``;

export const TabLayout = props => (
  <Wrapper>
    <TabMenu>
      <TabLink linkTo='/people'>People</TabLink>
    </TabMenu>
    <Contents>
      {props.children}
    </Contents>
  </Wrapper>
);
