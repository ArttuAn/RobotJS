import { render, screen, waitFor } from "@testing-library/react";
import { MemoryRouter } from "react-router-dom";
import { Project } from "../Project";
import { Provider } from "react-redux";
import { store } from "../../state";
import ProjectDetail from "../ProjectDetail";

describe("<ProjectDetail />", () => {
  let project: Project;
  let handleEdit: jest.Mock;
  const setup = () =>
    render(
      <Provider store={store}>
        <MemoryRouter>
          <ProjectDetail project={project} />
        </MemoryRouter>
      </Provider>
    );

  beforeEach(() => {
    project = new Project({
      id: 1,
      name: "Testinimi",
      description: "Testideskriptio",
      budget: 1000,
    });
    handleEdit = jest.fn();
  });

  //Yksikkötesti, harjoitustyö
  it("Tarkastetaan, että sivu renderöityy oikein.", async () => {
    setup();
    expect(screen).toBeDefined();
    expect(screen.getByRole("img")).toBeInTheDocument();
    expect(await screen.findByText(/Budget/i)).toBeInTheDocument();
    expect(await screen.findByText(/Signed/i)).toBeInTheDocument();
  });
});
