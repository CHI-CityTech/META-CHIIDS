import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { api } from '../services/api';
import ProjectCard from '../components/ProjectCard';
import FilterBar from '../components/FilterBar';

export default function ProjectList() {
  const [projects, setProjects] = useState([]);
  const [filteredProjects, setFilteredProjects] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filters, setFilters] = useState({
    search: '',
    domain: '',
    type: '',
    status: '',
  });
  const [domains, setDomains] = useState([]);
  const [types, setTypes] = useState([]);
  const [statuses, setStatuses] = useState([]);

  useEffect(() => {
    const loadProjects = async () => {
      setLoading(true);
      const data = await api.getProjects();
      setProjects(data);
      
      const doms = await api.getDomains();
      const typs = await api.getProjectTypes();
      const stat = await api.getStatuses();
      setDomains(doms);
      setTypes(typs);
      setStatuses(stat);
      
      setLoading(false);
    };
    loadProjects();
  }, []);

  useEffect(() => {
    // Filter projects based on current filters
    let result = projects;

    if (filters.search) {
      const search = filters.search.toLowerCase();
      result = result.filter(p =>
        p.name?.toLowerCase().includes(search) ||
        p.slug?.toLowerCase().includes(search)
      );
    }

    if (filters.domain) {
      result = result.filter(p => p.domain === filters.domain);
    }

    if (filters.type) {
      result = result.filter(p => p.type === filters.type);
    }

    if (filters.status) {
      result = result.filter(p => p.status === filters.status);
    }

    setFilteredProjects(result);
  }, [projects, filters]);

  const handleFilterChange = (newFilters) => {
    setFilters(newFilters);
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-500 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading projects...</p>
        </div>
      </div>
    );
  }

  return (
    <div>
      <div className="mb-8">
        <h2 className="text-3xl font-bold text-gray-900 mb-2">
          All Projects
        </h2>
        <p className="text-gray-600">
          {filteredProjects.length} of {projects.length} projects
        </p>
      </div>

      <FilterBar
        filters={filters}
        onFilterChange={handleFilterChange}
        domains={domains}
        types={types}
        statuses={statuses}
      />

      {filteredProjects.length === 0 ? (
        <div className="text-center py-12">
          <p className="text-gray-500 text-lg">No projects found matching your filters</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-8">
          {filteredProjects.map(project => (
            <Link key={project.slug} to={`/project/${project.slug}`}>
              <ProjectCard project={project} />
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}
