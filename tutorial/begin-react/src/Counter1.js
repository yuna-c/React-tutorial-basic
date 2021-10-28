import React, { useReducer } from 'react';

function reducer(state, action) {
//state : 값의 타입은 뭐든지 가능, 숫자, 문자, 객체, 배열    
    switch(action.type){
        case 'INCREMENT':
            return state + 1;
        case 'DECREMENT':
            return state - 1;
        default:
            // return state;
            throw new Error('Unhandled action');
    }
}

function Counter1() {
    const [number, dispatch] = useReducer(reducer, 0); //reducer, 초기값

    const onIncrease = () => {
        dispatch({
            type: 'INCREMENT'
        })
    }

    const onDecrease = () => {
        dispatch({
            type: 'DECREMENT'
        })
    }

    return (
        <div>
            <h1>{number}</h1>
            <button onClick={onIncrease}>+1</button>
            <button onClick={onDecrease}>-1</button>
        </div>
    )
};

export default Counter1;