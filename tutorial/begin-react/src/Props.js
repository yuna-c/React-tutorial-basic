import React from 'react';

function Props(props){
    console.log(props);
    return (
        <div name='hi' style={{color: props.color}}
        //자바스크립트 객체를 감싸는 괄호
        >하잉 프롭스{props.name}</div>
    )
}

export default Props;