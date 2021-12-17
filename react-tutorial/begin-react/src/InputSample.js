import React, { useState } from 'react';

function InputSample() {
    const [text, setText] = useState('');

    const onChange = (e) => {
        //e 이벤트 객체를 파라미터로 받아와서 사용
        //console.log(e.target.value);
        setText(e.target.value);
    };

    const onReset = () => {
        setText('');
    };
    return (
        <div>
            <input onChange={onChange} value={text}/>
            <button onClick={onReset}>초기화</button>
            <div>
                <b>값 : </b>
                {/* 어쩌고 저쩌고... */}
                {text}
            </div>
        </div>
    )
}

export default InputSample;
