import React,{ useState } from 'react';

function InputSample() {
    //input 값을 확인할 상태를 만들어 준다. 문자열 값 관리
    const [text, setText] = useState('');// 기본값 공백
    const onChange = (e) => { // input event 내용이 파라미터로 들어와 사용할 수 있게 되는 것 
        setText(e.target.value);
    }

    // 초기화 기능
    const onReset = () => {
       setText(''); 
    }
    return (
        <div>
            <input onChange={onChange} value={text} />
            <button onClick={onReset}>초기화</button>
            <div>
                <b>값 : </b>
                {text}
            </div>
        </div>
    );
}

export default InputSample;