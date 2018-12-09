import React from 'react';
import styled from 'styled-components';

const Wrapper = styled.div``;
const TabMenu = styled.ul``;
const TabLink = styled.li``;
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
