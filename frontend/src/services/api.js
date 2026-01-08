/**
 * API service for querying Datasette (CHIIDS database)
 * Queries run against localhost:8001 (local Datasette instance)
 */

const API_BASE = "http://localhost:8001/chiids";

export const api = {
  /**
   * Get all projects with optional filters
   */
  async getProjects(filters = {}) {
    let url = `${API_BASE}/projects.json?_shape=objects`;
    const params = new URLSearchParams();

    if (filters.search) {
      params.append("_search", filters.search);
    }
    if (filters.domain) {
      params.append("domain", filters.domain);
    }
    if (filters.type) {
      params.append("type", filters.type);
    }
    if (filters.status) {
      params.append("status", filters.status);
    }

    const qs = params.toString();
    if (qs) url += `&${qs}`;

    try {
      const response = await fetch(url);
      if (!response.ok) throw new Error("Failed to fetch projects");
      const data = await response.json();
      return data.rows || [];
    } catch (error) {
      console.error("Error fetching projects:", error);
      return [];
    }
  },

  /**
   * Get a single project by slug
   */
  async getProjectBySlug(slug) {
    const url = `${API_BASE}/projects.json?_shape=objects&slug=${encodeURIComponent(slug)}`;
    try {
      const response = await fetch(url);
      if (!response.ok) throw new Error("Failed to fetch project");
      const data = await response.json();
      return data.rows?.[0] || null;
    } catch (error) {
      console.error("Error fetching project:", error);
      return null;
    }
  },

  /**
   * Get all dependencies
   */
  async getDependencies() {
    const url = `${API_BASE}/dependencies.json?_shape=objects`;
    try {
      const response = await fetch(url);
      if (!response.ok) throw new Error("Failed to fetch dependencies");
      const data = await response.json();
      return data.rows || [];
    } catch (error) {
      console.error("Error fetching dependencies:", error);
      return [];
    }
  },

  /**
   * Get dependencies for a specific project
   */
  async getProjectDependencies(projectSlug) {
    const url = `${API_BASE}/dependencies.json?_shape=objects&source_project_slug=${encodeURIComponent(projectSlug)}`;
    try {
      const response = await fetch(url);
      if (!response.ok) throw new Error("Failed to fetch project dependencies");
      const data = await response.json();
      return data.rows || [];
    } catch (error) {
      console.error("Error fetching project dependencies:", error);
      return [];
    }
  },

  /**
   * Get all unique domains
   */
  async getDomains() {
    const projects = await this.getProjects();
    const domains = [...new Set(projects.map(p => p.domain).filter(Boolean))];
    return domains.sort();
  },

  /**
   * Get all unique project types
   */
  async getProjectTypes() {
    const projects = await this.getProjects();
    const types = [...new Set(projects.map(p => p.type).filter(Boolean))];
    return types.sort();
  },

  /**
   * Get all unique statuses
   */
  async getStatuses() {
    const projects = await this.getProjects();
    const statuses = [...new Set(projects.map(p => p.status).filter(Boolean))];
    return statuses.sort();
  },
};
