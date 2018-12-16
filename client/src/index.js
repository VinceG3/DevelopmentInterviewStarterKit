import './global.css'

import React from "react";
import ReactDOM from 'react-dom';
import App from './components/App'

import createHistory from 'history/createBrowserHistory'

// bootstrap state
// store.dispatch(fetchMe());

ReactDOM.render(
  <App />,
  document.getElementById('root')
);