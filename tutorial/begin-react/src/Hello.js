import React, { Component } from 'react'; 

class Hello extends Component {
    static defaultProps = {
        name : '이름 없음',
    };
    render() {
        const { color, isSpecial, name } = this.props;
        // 비구조화 추출을 이용해 props 사용
        return (
            <div style ={{ color }}>
                {isSpecial && <b>*</b>}
                안녕하세요 {name}
            </div>
        );
    }
}

// function Hello({ color, name, isSpecial }) { //삼항 연산자 사용해 true/false일떄의 다른 값 추출
//     return (
//         <div style={{
//             color //color : props.color => color : color
//         }}> 
//         {/* {isSpecial ? <b>*</b> : null}  */}
//         {/* isSpecial값이 트루면 *표시 아니면 null */}
//         <b>{isSpecial ? '스페셜하다!' :  '낫스페셜'}</b> 
//         {/* {isSpecial && <b>*</b>}  */}
//         {/* and 연산자가 더 편함, isSpecial = false일때, 저 and 연산자가 false가 되기때문에 출력이 안됨, true일때는 뒤에 나타나는 값이 결과가 되기 때문에 출력 */}
//         {/* null, undefined, false 같은 값은 표현이 안되는데, false인 값의 0 이라는 숫자는 표시가 됨 */}
       
//             안녕하세요 {name}
//         </div>
//     ); 
// }

//기본 props 설정하는 법
// Hello.defaultProps = { //객체설정
//     name : '이름없음' ,
//     color : 'blue'
// }

export default Hello;  