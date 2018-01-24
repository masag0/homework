import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor (props) {
    super(props);
    this.state = { giphys: props.giphys, searchTerm: "" };
  }

  handleChange (e) {
    const searchTerm = e.currentTarget.value;
    this.props.fetchSearchGiphys(searchTerm).then(
      this.setState({ giphys: this.props.giphys, searchTerm }),
      console.log(this.props.giphys)
    );
  }

  render () {
    const {searchTerm} = this.state;
    return (
      <div>
        <input type="text" value={searchTerm} onChange={(e) => this.handleChange(e)}></input>

        <GiphysIndex {...this.state}/>

      </div>
    );
  }
}

export default GiphysSearch;