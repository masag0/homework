import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
    this.state = { num1: "", num2: "", result: 0};
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.clear = this.clear.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
  }

  // your code here

  render() {
    const { num1, num2, result } = this.state;
    return (
      <div>
        <h1>{result}</h1>
        <br />
        <input type="text" onChange={this.setNum1} value={num1}/>
        <input type="text" onChange={this.setNum2} value={num2}/>
        <button onClick={this.clear}>Clear</button>
        <br />
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>x</button>
        <button onClick={this.divide}>/</button>
      </div>
    );
  }

  setNum1(e) {
    const num1 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({num1});
  }

  setNum2(e) {
    const num2 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({num2});
  }

  clear (e) {
    e.preventDefault();
    this.setState({num1: "", num2: "", result: 0});
  }

  add (e) {
    e.preventDefault();
    let result = this.state.num1 + this.state.num2;
    this.setState({num1: "", num2: "", result: result});
  }

  subtract (e) {
    e.preventDefault();
    let result = this.state.num1 - this.state.num2;
    this.setState({num1: "", num2: "", result: result});
  }

  multiply (e) {
    e.preventDefault();
    let result = this.state.num1 * this.state.num2;
    this.setState({num1: "", num2: "", result: result});
  }

  divide (e) {
    e.preventDefault();
    let result = this.state.num1 / this.state.num2;
    this.setState({num1: "", num2: "", result: result});
  }

}

export default Calculator;




