import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor (props) {
    super(props);
    this.state = { searchTerm: "" };
  }

  handleChange (e) {
    const searchTerm = e.currentTarget.value;
    this.props.fetchSearchGiphys(searchTerm).then(
      this.setState({searchTerm })
    );
  }

  render () {
    const {searchTerm} = this.state;
    return (
      <div>
        <h1>Search For Giphys!</h1>
        <input type="text" value={searchTerm} onChange={(e) => this.handleChange(e)}></input>

        <GiphysIndex {...this.props}/>

      </div>
    );
  }
}

export default GiphysSearch;