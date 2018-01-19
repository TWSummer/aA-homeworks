import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = {result: 0, num1: "", num2: ""};
  }

  //your code here

  setNum1(event) {
    this.setState({num1: event.currentTarget.value});
  }

  setNum2(event) {
    this.setState({num2: event.currentTarget.value});
  }

  times(e) {
    e.preventDefault();
    this.setState({ result: this.state.num1 * this.state.num2});
  }

  divide(e) {
    e.preventDefault();
    this.setState({ result: this.state.num1 / this.state.num2});
  }

  minus(e) {
    e.preventDefault();
    this.setState({ result: this.state.num1 - this.state.num2});
  }

  plus(e) {
    e.preventDefault();
    this.setState({ result: parseInt(this.state.num1) + parseInt(this.state.num2)});
  }

  render(){
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input type="text" onChange={this.setNum1.bind(this)}></input>
        <input type="text" onChange={this.setNum2.bind(this)}></input>
        <br />
        <button onClick={this.times.bind(this)}>*</button>
        <button onClick={this.divide.bind(this)}>/</button>
        <button onClick={this.plus.bind(this)}>+</button>
        <button onClick={this.minus.bind(this)}>-</button>
      </div>
    );
  }
}

export default Calculator;
