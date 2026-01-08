import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { api } from '../services/api';

export default function ProjectDetail() {
  const { slug } = useParams();
  const [project, setProject] = useState(null);
  const [dependencies, setDependencies] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const loadProject = async () => {
      setLoading(true);
      const proj = await api.getProjectBySlug(slug);
      setProject(proj);

      if (proj) {
        const deps = await api.getProjectDependencies(slug);
        setDependencies(deps);
      }
      setLoading(false);
    };
    loadProject();
  }, [slug]);

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-500 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading project...</p>
        </div>
      </div>
    );
  }

  if (!project) {
    return (
      <div className="text-center py-12">
        <h2 className="text-2xl font-bold text-gray-900 mb-4">Project not found</h2>
        <Link to="/" className="text-blue-600 hover:text-blue-800 font-semibold">
          ← Back to projects
        </Link>
      </div>
    );
  }

  return (
    <div>
      <Link to="/" className="text-blue-600 hover:text-blue-800 font-semibold mb-6 inline-block">
        ← Back to projects
      </Link>

      <div className="bg-white rounded-lg shadow-md p-8 mb-8">
        <h1 className="text-4xl font-bold text-gray-900 mb-2">
          {project.name}
        </h1>

        <div className="flex gap-3 my-4">
          {project.domain && (
            <span className="px-4 py-2 bg-blue-100 text-blue-800 rounded-full font-semibold">
              {project.domain}
            </span>
          )}
          {project.type && (
            <span className="px-4 py-2 bg-gray-200 text-gray-800 rounded-full">
              {project.type}
            </span>
          )}
          {project.status && (
            <span className="px-4 py-2 bg-green-100 text-green-800 rounded-full font-semibold">
              {project.status}
            </span>
          )}
          {project.maturity_level && (
            <span className="px-4 py-2 bg-blue-100 text-blue-800 rounded-full font-semibold">
              {project.maturity_level}
            </span>
          )}
          {typeof project.priority !== 'undefined' && project.priority !== null && (
            <span className="px-4 py-2 bg-yellow-100 text-yellow-800 rounded-full font-semibold">
              Priority: P{project.priority}
            </span>
          )}
        </div>

        {project.description && (
          <p className="text-gray-700 text-lg mt-6 mb-6">
            {project.description}
          </p>
        )}

        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mt-8 pt-8 border-t">
          {project.slug && (
            <div>
              <dt className="text-sm font-medium text-gray-600">Slug</dt>
              <dd className="text-lg font-mono text-gray-900">{project.slug}</dd>
            </div>
          )}
          {project.primary_parent_id && (
            <div>
              <dt className="text-sm font-medium text-gray-600">Parent ID</dt>
              <dd className="text-lg text-gray-900">{project.primary_parent_id}</dd>
            </div>
          )}
          {project.created_at && (
            <div>
              <dt className="text-sm font-medium text-gray-600">Created</dt>
              <dd className="text-lg text-gray-900">{project.created_at}</dd>
            </div>
          )}
          {typeof project.priority !== 'undefined' && project.priority !== null && (
            <div>
              <dt className="text-sm font-medium text-gray-600">Priority</dt>
              <dd className="text-lg text-gray-900">P{project.priority}</dd>
            </div>
          )}
          {project.maturity_level && (
            <div>
              <dt className="text-sm font-medium text-gray-600">Maturity</dt>
              <dd className="text-lg text-gray-900">{project.maturity_level}</dd>
            </div>
          )}
        </div>
      </div>

      {dependencies.length > 0 && (
        <div className="bg-white rounded-lg shadow-md p-8">
          <h2 className="text-2xl font-bold text-gray-900 mb-6">
            Dependencies
          </h2>

          <div className="space-y-4">
            {dependencies.map((dep, idx) => (
              <div key={idx} className="border-l-4 border-blue-500 pl-4 py-2">
                <p className="text-sm text-gray-600">Depends on:</p>
                <p className="text-lg font-semibold text-gray-900">
                  {dep.target_project_slug}
                </p>
                {dep.description && (
                  <p className="text-gray-700 text-sm mt-1">
                    {dep.description}
                  </p>
                )}
                {dep.dependency_type && (
                  <span className="inline-block mt-2 px-2 py-1 bg-gray-200 text-gray-700 text-xs rounded">
                    {dep.dependency_type}
                  </span>
                )}
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
}
