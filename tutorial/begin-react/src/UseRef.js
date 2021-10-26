import React,{ useState, useRef } from 'react';
// 돔에 직접 접근하는 방법
function InputSample() {
    const [inputs, setInputs] = useState({
        //객체 업데이트 
        name : '',
        nickname : '',  
    });
    // use 객체 만들기
    const nameInput = useRef();
    
    const { name, nickname } = inputs; 
    const onChange = (e) => { 
        const { name, value } = e.target; 

        setInputs({
            ...inputs,
            [name] : value,
        });
    };

    const onReset = () => {
        setInputs({
            name : '',
            nickname : '',
        });
        //current Dom 객체 가져오기
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
            <button onClick={onReset}>초기화</button>
            <div>
                <b>값 : </b>
                {name}({nickname})
            </div>
        </div>
    );
}

export default InputSample;