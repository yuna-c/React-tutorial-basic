import React, { useState } from 'react'; //useState  => 리액트에서 useState라는 함수를 가져옴

function Counter() {
    const [number, setNumber] = useState(0); //useState(0) 배열을 반환(배열 비구조화 할당)
    // number라는 상태를 만들건데, 이 상태의 기본 값을 0으로 하겠다, setNumber는 기본 값을 바꿔주는 값이다.

    // 원래 이렇게 진행이 되야되는데, 배열 비구조화 할당을 통해 위의 형태로 표시
    // const numberState = uesState(0);
    // const number = numberState[0]; //첫번째 원소
    // const setNumber = numberState[1]; //두번째 원소

    const onIncrease = () => {
        //console.log('+1);
        //number을 0으로 만들고, setNumber을 이상태로 바꾸어주는 것
        // setNumber(number + 1);
        // 어떻게 업데이트 할 지의 대한 로직을 정의하는 함수를 넣어줄 수도 있다. (최적화와 관련이 있음) = 함수형 업데이트
        setNumber(prevNumber => prevNumber + 1); //업데이트 함수
    }
    const onDecrease = () => {
        //console.log('-1);
        //setNumber(number - 1)
         setNumber(prevNumber => prevNumber - 1);
    }
    return (
        <div>
            <h1>{number}</h1>
            {/* 함수를 넣어주는거지 함수를 호출()해 주는 게 아님 */}
            <button onClick={onIncrease}>+1</button>
            <button onClick={onDecrease}>-1</button>
        </div>
    )
}
export default Counter;