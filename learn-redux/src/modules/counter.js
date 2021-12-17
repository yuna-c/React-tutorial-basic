// '모듈이름/액션'
const SET_DIFF = 'counter/SET_DIFF';
const INCREASE = 'counter/INCREASE';
const DECREASE = 'counter/DECREASE';


// 액션 생성 함수
export const setDiff = diff => ({ type: SET_DIFF, diff });
export const increase = () => ({ type: INCREASE });
export const decrease = () => ({ type: DECREASE });

// 모듈의 초기 상태 생성
const initialState = {
    number: 0,
    diff: 1,
};

// 리듀서 작성
export default function counter(state = initialState, action) {
    switch (action.type) {
        case SET_DIFF:
           return {
               ...state,
               diff: action.diff,
           } 
        default:
            return state;
    }
}