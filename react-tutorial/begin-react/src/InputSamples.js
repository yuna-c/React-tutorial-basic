import React, { useState, useRef } from 'react';

function InputSamples() {
    //객체 형태의 상태
    const [inputs, setInputs] = useState({
        name : '',
        nickname : '',
        email : '',
    }); 

    const nameInput = useRef();
    // 비구조화 할당으로 추출 
    const { name, nickname, email } = inputs;
    const onChange = (e) => {
        // 추출
        const { name, value } = e.target;
    
        // console.log(e.target.name);
        // console.log(e.target.value);

        setInputs({
            ...inputs,
            [name] : value,
            //name = name, nickname
        });
    };

    const onReset = () => {
        setInputs({
            name: '',
            nickname: '',
            email: ''
        });
        nameInput.current.focus();
    };
    return (
        <div>
            <input 
                name="name" 
                placeholder="이름" 
                onChange={onChange} 
                value={name} 
                ref={nameInput}
            />
            <input 
                name="nickname" 
                placeholder="닉네임" 
                onChange={onChange} 
                value={nickname} 
            />
            <input
                name="email"
                placeholder="이메일"
                onChange={onChange}
                value={email}
            />
            <button onClick={onReset}>초기화</button>
            <div>
                <b>값 : </b>
                {name} ({nickname}) [{email}]
            </div>
        </div>
    )
}

export default InputSamples;
