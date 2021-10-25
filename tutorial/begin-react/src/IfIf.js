import React from 'react';

function IfIf({ color, name, isSpecial2}){
   return (
       <div style={{color}}>
           <b>{isSpecial2 ? '스페셜하다!' : '스페셜하지 않다'}</b>안녕하세요{name}{0}{false}
           {/* 삼항 연산자 : 내용이 달라져야할 때 사용함 */}
            <br />
           {isSpecial2 && <b>***</b>}
           {/* and 연산자 : false일때 아무것도 안나오고, true일때는 별이 나옴 */}
           안녕하세요{name}{0}{false}
       </div>
    )
}

export default IfIf;