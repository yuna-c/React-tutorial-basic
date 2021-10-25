import React from 'react';
{/* <Wrapper>dfajffghfd3rfjdfjdclk</Wrapper> */}
// div가 아니고 어떠한 compenent 일 때, Wrapper 안에 넣는 값을 조회하는것이 propsChildren

function Wrapper({ children }){ // 밖으로 추출
    const style = {
        border : '2px solid black',
        padding : 16
    };

    return <div style={style}>{children}porps.children</div>
}

export default Wrapper;