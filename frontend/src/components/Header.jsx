import { Link } from 'react-router-dom';

export default function Header() {
  return (
    <header className="bg-white shadow-sm">
      <div className="container mx-auto px-4 py-6">
        <Link to="/" className="flex items-center gap-3">
          <div className="w-10 h-10 bg-gradient-to-r from-blue-500 to-blue-600 rounded-lg flex items-center justify-center">
            <span className="text-white font-bold text-lg">◇</span>
          </div>
          <div>
            <h1 className="text-2xl font-bold text-gray-900">CHIIDS Explorer</h1>
            <p className="text-sm text-gray-600">Meta-Project Discovery</p>
          </div>
        </Link>
      </div>
    </header>
  );
}
