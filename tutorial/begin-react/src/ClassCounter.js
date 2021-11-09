import React, { Component } from 'react'; 

class Counter extends Component {
    // 호출하는 순간 끊겨서 undefind를 호출하지 않게 하는법, 온전한 this 출력방법
    //1 constructor
    // constructor(props) {
    //     super(props);
    //     // this.handleIncrease = this.handleIncrease.bind(this);
    //     // this.handleDecrease = this.handleDecrease.bind(this);

    //     this.state = {
    //         counter : 0,

    //     };

    //     // bind 함수에서 this를 가르키면 console.log('increase');를 this로 갖게해라
    // }

    // 3 state(바로 값을 정해주는 것, barbel class 프로퍼티스만 가능)
    state = { 
        counter : 0,
        fixed : 1,
        updateMe : {
            toggleMe : false,
            dontChamgeMe : 1,
        }
    }

    //2 커스텀 메서드에 화살표 함수로 메서드를 작성
    //커스텀 메서드 : 클래스 내부에 함수를 설정하는 것
    handleIncrease = () => {
        // console.log(this);
        // console.log('increase');

        // this.setState({
        //     counter : this.state.counter + 1
        // });

        this.setState(state => ({ //여러개 실행하면 4씩올라감
            counter : state.counter + 1
        }));
        // this.setState(state => ({
        //     counter : state.counter + 1
        // }));
        // this.setState(state => ({
        //     counter : state.counter + 1
        // }));
        // this.setState(state => ({
        //     counter : state.counter + 1
        // }));
    }
    handleDecrease = () => {
        // console.log('decrease');
        this.setState({ 
            //상태로 바꿔달라고 요청하는 함수
            counter : this.state.counter - 1
        });
    }

    handleToggle = () => {
        this.setState({
            updateMe : {
                ...this.state.updateMe,
                toggleMe : !this.state.updateMe.toggleMe,
            }
        })
    }
    render() {
        return (
            <div>
                <h1>{this.state.counter}</h1>
                <button onClick={this.handleIncrease}>+1</button>
                <button onClick={this.handleDecrease}>-1</button>
                <p>고정된 값 : {this.state.fixed}</p>
            </div>
        )
    }
};

export default Counter;