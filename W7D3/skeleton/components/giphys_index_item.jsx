import React from 'react';

const giphysIndexItem = (props) => {
  // console.log(props);
  return (
    <li>
      {props.title}
      <iframe src={props.url} width="200" height="200"></iframe>
    </li>
  );
};

export default giphysIndexItem;