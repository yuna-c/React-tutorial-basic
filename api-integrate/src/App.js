import Users from './Users';
import { UsersProvider } from './UsersContext';

function App() {
    const name = 'react';
    const style = {
        backgroundColor : 'black',
        color : 'aqua',
        fontSize : '24',//px
        padding : '1rem'//단위는 '' 안에서 문자열로 넣어주기
    };
    return (
        <UsersProvider>  
            <div style={style}>{name}</div>
            <Users />
        </UsersProvider>
    );
}

export default App;
 