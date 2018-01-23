import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  // store.dispatch = addLoggingToDispatch(store);
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// const addLoggingToDispatch = (store) => {
//   const local = store.dispatch;
//   return (action) => {
//     console.log("Old State: ");
//     console.log(store.getState());
//     console.log(action);
//     local(action);
//     console.log("New State: ");
//     console.log(store.getState());
//   };
// };

const addLoggingToDispatch = store => next => action => {
  console.log("Old State: ");
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log("New State: ");
  console.log(store.getState());
};