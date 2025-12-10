export default function ProjectCard({ project }) {
  const getDomainColor = (domain) => {
    const colors = {
      'Engineering': 'bg-blue-100 text-blue-800',
      'Artistic': 'bg-purple-100 text-purple-800',
      'Infrastructure': 'bg-gray-100 text-gray-800',
      'Foundational': 'bg-green-100 text-green-800',
    };
    return colors[domain] || 'bg-gray-100 text-gray-800';
  };

  const getStatusColor = (status) => {
    const colors = {
      'active': 'bg-green-100 text-green-800',
      'inactive': 'bg-gray-100 text-gray-800',
      'planned': 'bg-yellow-100 text-yellow-800',
      'archived': 'bg-red-100 text-red-800',
    };
    return colors[status] || 'bg-gray-100 text-gray-800';
  };

  return (
    <div className="bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow p-6 h-full flex flex-col">
      <h3 className="text-xl font-bold text-gray-900 mb-2">
        {project.name}
      </h3>
      
      <p className="text-gray-600 text-sm mb-4 flex-grow">
        {project.description || 'No description available'}
      </p>

      <div className="space-y-3">
        {project.domain && (
          <div>
            <span className={`inline-block px-3 py-1 rounded-full text-xs font-semibold ${getDomainColor(project.domain)}`}>
              {project.domain}
            </span>
          </div>
        )}

        <div className="flex gap-2 flex-wrap">
          {project.type && (
            <span className="px-2 py-1 bg-gray-200 text-gray-700 rounded text-xs">
              {project.type}
            </span>
          )}
          {project.status && (
            <span className={`px-2 py-1 rounded text-xs font-semibold ${getStatusColor(project.status)}`}>
              {project.status}
            </span>
          )}
        </div>
      </div>
    </div>
  );
}
