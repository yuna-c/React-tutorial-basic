import Home from './home';
import About from './About';
import { Routes, Route, Link } from "react-router-dom";
import Profile from './Profile';

function App() {
  return (
    <div>
      <h1>Welcome to React Router!</h1>
      <ul>
        <li>
          <Link to="/">홈</Link>
        </li>
        <li>
          <Link to="/about">소개</Link>
        </li>
        <li>
          <Link to = '/profile/velopert'>velopert 프로필</Link>
        </li>
      </ul>
      <hr />
      <Routes>
        <Route path="/" component={Home} element={<Home />} exact />
        <Route path="about" component={About} element={<About />} />
        <Route path="/profiles/:username" component={Profile} element={<Profile />}/>
      </Routes>
    </div>
  );
}

export default App;
