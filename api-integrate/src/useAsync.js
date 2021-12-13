import { useReducer, useEffect, useCallback } from 'react';

// 파일을 따로 빼 내서 재사용 할 수 있다 
// LOADING, SUCCESS, ERROR
function reducer(state, action) {
    switch (action.type) {
        case 'LOADING':
            return {
                loading: true,
                data: null,
                error: null,
            };
        case 'SUCCESS':
            return {
                loading: false,
                data: action.data,
                error: null,
            };
        case 'ERROR':
            return {
                loading: false,
                data: null,
                error: action.error,
            };
        default:
            throw new Error(`Unhandled action type: ${action.type}`);
    }
};

// 커스텀 훅 작성하기
// callback 함수(API 호출하는 함수) , dependency(useEffect를 사용하여 컴포넌트가 로딩, 값이 변경됬을 때 API 재요청시 사용)
function useAsync(callback, deps = [], skip = false) {
    const [state, dispatch] = useReducer(reducer, {
        loading: false,
        data: null,
        error: null
    });

    const fetchData = useCallback(async () => {
        dispatch({ type: 'LOADING' });
        try {
            const data = await callback();
            dispatch({ type: 'SUCCESS', data });
        } catch (e) {
            dispatch({ type: 'ERROR', error: e });
        }
    }, [callback]);

    useEffect(() => {
        if (skip) {
            return;
        }
        fetchData();
        // eslint 설정을 다음 줄에서만 비활성화
        // eslint-disable-next-line
    }, deps);

    return [state, fetchData];
    //useAsync를 통해서 state 첫번째 값에서는 상태를 가지고오고, fetchData 두번째값에서는 특정 요청을 다시 시작하는 함수를 받아와서 쓰게 됨
}; 

export default useAsync;