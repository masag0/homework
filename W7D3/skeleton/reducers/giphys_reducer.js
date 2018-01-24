import { RECEIVE_SEARCH_GIPHYS } from '../actions/giphy_actions';

const initalState = {};

const giphyReducer = (oldState = initalState, action) => {
  const newState = {};
  switch (action.type) {
    case RECEIVE_SEARCH_GIPHYS:
      return action.giphys;

    default:
      return oldState;
  }
};

export default giphyReducer;