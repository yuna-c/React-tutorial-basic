import { useState, useReducer, useCallback } from 'react';


// reducer 
function reducer(state, action){
    switch (action.type) {
        case 'CHANGE' :
            return {
                ...state,
                [action.name] : action.value
            };
        case 'RESET' : 
            return Object.keys(state).reduce((acc, current) => {
                acc[current] = '';
                return acc;
            }, {});
            default :
                return state;
    }
}

function useInputs(initialForm) {
    const [form, dispatch] = useReducer(reducer, initialForm);

    // CHANGE
    const onChange = useCallback (e => {
        const {name, value} = e.target;
        dispatch({type : 'CHANGE', name, value});
    }, []);
    // RESET
    const reset = useCallback(() => {
        dispatch({type : 'RESET'})
    }, []);
    return [form, onChange, reset];
}

// custom hook을 만들때는 use라는 키워드를 쓴다
// function useInputs (initialForm) { // 해당 input form에서 관리할 초기값(파라미터)
//     const [form, setForm] = useState(initialForm);
//     const onChange = useCallback(e => {
//         const { name, value } = e.target;// 추출
//         setForm( form => ({ ...form , [name] : value}))// form 을 업데이트, name 값을 value로 설정
//     }, []); //deps 빈배열

//     // form을 초기화 하는 역할
//     const reset = useCallback(() => setForm(initialForm), [initialForm]); // deps배열안에 파라미터 가져오기

//     // 밖으로 내보내기
//     return [ // [배열형태] , {객체형태} 둘중 하나로 내보낸다
//         form, onChange, reset //상태, 이벤트, 초기화하는 함수
//     ];

    
// };

export default useInputs;