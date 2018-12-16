import React from 'react'
import PropTypes from 'prop-types'
import { BrowserRouter as Router, Route } from 'react-router-dom'
import { TabLayout } from './TabLayout'
import People from './People'

const theme = {
  main: {
    colors: {
      medium: '#403075',
      light: '#887CAF',
      medium_light: '#615192',
      medium_dark: '#261758',
      dark: '#13073A',
    }
  }
};

const App = ({ store }) => (
  <TabLayout>
    <Router>
      <Route exact path="/" component={People} />
    </Router>
  </TabLayout>
);

export default App
