import React, { useState } from 'react';

function InputSample() {
    const [inputs, setInputs] = useState({
        //객체 업데이트 
        name : '',
        nickname : '',
    })

    //name 과 nickname 비구조화할당을 통해 사용하기 쉽게 추출
    const { name, nickname } = inputs; //정보들을 참고해서 객체를 업데이트 해준다

    const onChange = (e) => {
        //추출
        const { name, value } = e.target;

        // console.log(e.target.name);
        // console.log(e.target.value);

        // //기존의 객체 복사
        // const nextInputs = {
        //     ...inputs,
        //     [name] : value,
        // };
        
        // //특정 값 덮어 씌우기
        // // nextInputs[name] = value;


        // setInputs(nextInputs);

        setInputs({
            ...inputs, //객체를 복사한후
            [name]: value, // 새로운 값을 덮어 씌운다
        });
    };


    const onReset = () => {
        setInputs({
            name : '',
            nickname : '',
        })
    };

    return (
        <div>
            <input 
                name="name" 
                placeholder="이름" 
                onChange={onChange} 
                value={name}
            />
            <input 
                name="nickname" 
                placeholder="닉네임" 
                onChange={onChange} 
                value={nickname}
            />
            <button onClick={onReset}>초기화</button>
            <div>
                <b>이름 : </b>{name} (<b>닉네임 : </b>{nickname})
            </div>
        </div>
    );
}

 export default InputSample;