import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import './App.css';
import ProjectList from './pages/ProjectList';
import ProjectDetail from './pages/ProjectDetail';
import Header from './components/Header';

function App() {
  return (
    <Router>
      <div className="min-h-screen bg-gray-50">
        <Header />
        <main className="container mx-auto px-4 py-8">
          <Routes>
            <Route path="/" element={<ProjectList />} />
            <Route path="/project/:slug" element={<ProjectDetail />} />
          </Routes>
        </main>
      </div>
    </Router>
  );
}

export default App;
