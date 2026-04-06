import { MOCK_PROJECTS } from "../MockProjects";
import { projectAPI } from "../projectAPI";

describe("projectAPI", () => {
  test("should return records", () => {
    const response = new Response(JSON.stringify(MOCK_PROJECTS), {
      status: 200,
      statusText: "OK",
      headers: { "Content-Type": "application/json" },
    });
    jest
      .spyOn(window, "fetch")
      .mockImplementation(() => Promise.resolve(response));
    return projectAPI.get().then((data) => {
      expect(data).toHaveLength(MOCK_PROJECTS.length);
      expect(data[0].name).toBe(MOCK_PROJECTS[0].name);
      expect(data[data.length - 1].id).toBe(
        MOCK_PROJECTS[MOCK_PROJECTS.length - 1].id
      );
    });
  });
});
