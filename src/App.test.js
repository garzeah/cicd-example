import { render, screen } from '@testing-library/react';
import App from './App';

test('renders Andy link', () => {
  render(<App />);
  const linkElement = screen.getByText(/Production/i);
  expect(linkElement).toBeInTheDocument();
});