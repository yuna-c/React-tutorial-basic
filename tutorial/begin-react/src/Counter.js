import React, { useState } from 'react'; //useState  => 리엑트에서 useState라는 값을 가져옴

function Counter() {
    const [number, setNumber] = useState(0); //useState(0) 배열을 반환
    const onIncrease = () => {
        //number을 0으로 만들고, setNumber을 이상태로 바꾸어주는 것
        setNumber(number + 1);
    }
    const onDecrease = () => {
        setNumber(number - 1)
    }
    return (
        <div>
            <h1>{number}</h1>
            {/* 함수를 넣어주는거지 함수를 호출해 주는 게 아님 */}
            <button onClick={onIncrease}>+1</button>
            <button onClick={onDecrease}>-1</button>
        </div>
    )
}
export default Counter;