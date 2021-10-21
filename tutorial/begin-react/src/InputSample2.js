import React,{ useState } from 'react';

function InputSample() {
    const [inputs, setInputs] = useState({
        //객체 업데이트 
        name : '',
        nickname : '',  
    });
    const { name, nickname } = inputs; //정보들을 참고해서 객체를 업데이트 해준다
    const onChange = (e) => { 
        const { name, value } = e.target; //추출

        // const nextInputs = { //기존의 객체 복사(새로운 객체를 새로운 상태로 쓰곘다)
        //     ...inputs,// spread 문법
        //     [name] : value,
        // }
        
        // 특정 값 덮어씌우기 
        //nextInputs[name] = value;
        
        // console.log(e.target.name);
        // console.log(e.target.value);

        //새로운 객체 만들고 불변성을 지킨다
        setInputs({
            ...inputs,// spread 문법
            [name] : value,
        });
        
    };

    const onReset = () => {
        setInputs({
            name : '',
            nickname : '',
        });
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
                <b>값 : </b>
                {name}({nickname})
            </div>
        </div>
    );
}

export default InputSample;