import React from 'react';

import GiphysIndexItem from './giphys_index_item';

class GiphysIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  render () {

    return (
      <ul>
        {
          this.props.giphys.map((el, idx) => {
            return (
              <GiphysIndexItem
                key={idx}
                title={el.title}
                url={el.embed_url}
              />
            );
          })
        }
      </ul>
    );
  }
}

export default GiphysIndex;